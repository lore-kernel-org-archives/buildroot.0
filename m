From: Richard Hardy <richardh@oakleafconsultancy.com>
Date: Mon, 4 Aug 2008 14:52:54 +0100
Subject: [Buildroot] C double type problem - at91sam9263
Message-ID: <223E6519BDCAC74695BEE9D163F8E6592306E7@oakleaf10.oakleafconsultancy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Do you get any warnings when compiling your test program? What happens
if
> you: test = 1.0;
> 
> I'm thinking maybe it's a casting problem.
> 
> John
> 

If I do:
test = 1.0;
fprintf(stderr, "Test double = %f.\n", test);

I get exactly the same results. i.e. it displays:
1000000

Richard.
