
package org.mini.dto;

public class Criteria {
	
	private int page;
	private int size;
	
	private int blockSize;
	
	public Criteria() {
		this(1, 3, 3);
	}

	public Criteria(int page, int size, int blockSize) {
		this.page = page;
		this.size = size;
		this.blockSize = blockSize;
	}
	
	public void setSize(int size) {
		this.size = size;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return this.page;
	}
	
	public int getSkip() {
		return (this.page - 1) * this.size;
	}
	public int getBlockSize() {
		return this.blockSize != 0 ? this.blockSize : 10;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getSize() {
		return this.size != 0? this.size:10;
	}

}
