From: scsijon <scsijon@lamiaworks.com.au>
Date: Mon, 11 Mar 2019 13:04:43 +1100
Subject: [Buildroot] ? using compilers other than gcc!
Message-ID: <43556bee-b905-8e11-c71d-d87aa92d13f5@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloaded the latest 2019-02 buildroot, I found where to set musl, but 
can't see how to change the compiler from gcc to another and I want to 
try the latest pcc?

-------
A little history

In my former life I worked with S.C.O.'s Unix for a while and a C 
compiler called PCC, tiny, quick and fun to use. Like many things from 
back then I had thought it died. (Oh, and it's not the kernel's pcc, 
which is an entirely different thing.) However, apparently it didn't go 
completely, but has continued and reapeared a few times over the years 
for BSD Users systems.
---------

However it has now seriously surfaced again into the general linux 
world, with a few decent step-ups, and worth at least looking at as far 
as i'm concerned, like it's still fast and tight and it's MUSL aware, 
needs only one library package for us to work with, builds it's own GCC, 
and can rebuild itself. And NO it doesn't do everything GCC does, but do 
we really need all that.....

Links worth looking at are 
https://www.phoronix.com/scan.php?page=news_item&px=PCC-Still-Going-2016;
http://pcc.ludd.ltu.se/supported-platforms/;
https://lwn.net/Articles/255558/.
Yeah, I know none of them are new, but the people behind the latest 
stuff put it in the work, not the doc's.

You can get it and it's library at http://pcc.ludd.ltu.se/ftp/pub/pcc/ 
if it interests you.

So, back to the question, how can I use it?

thanks
