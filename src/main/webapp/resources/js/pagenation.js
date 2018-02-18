/**
 * 
 */
/*function makePage(param) {
	
	var last = Math.ceil(param.page / 10.0) * 10;
	var first = last - 9;
	
	var prev = false;
	var next = true;
	
	if(last * param.size >= param.total) {
		last = Math.ceil(param.total / (param.size * 1.0));
		next= false;
	}
	prev = first != 1 ? true : false;
		
	return {last:last, first:first, prev:prev, next:next, page: param.page};
	
}*/
function makePage(param){

    var last = Math.ceil(param.page / (param.blocksize * 1.0)) * param.blocksize;
    var first = last - (param.blocksize - 1);
    var prev = false, next = true;
    //console.log("first : " + first);
    if(param.total <= last * param.size  ){
        last = Math.ceil(param.total/ (param.size * 1.0));
        next = false;
    }
    prev = first != 1 ? true : false;
    console.log("first : " + first);
    return {first:first, last:last, next:next, prev:prev, page: param.page};
}

