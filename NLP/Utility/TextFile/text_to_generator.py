
def read_lines_in_batches(file_path, batch_size=10000):
    """
    Read a text file in batches of lines.
    :param file_path: Path to the text file.
    :param batch_size: Number of lines to read in each batch.
    """
    with open(file_path, 'r') as file:
        batch = []
        for line in file:
            batch.append(line.strip())
            if len(batch) == batch_size:
                yield batch
                batch = []        
        # Yield any remaining lines (less than batch_size)
        if batch:
            yield batch

# Example usage:
file_path = 'path/to/file.txt'
for idx, batch in enumerate(read_lines_in_batches(file_path)):
    print('Batch', idx, 'has', len(batch), 'lines')