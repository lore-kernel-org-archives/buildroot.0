From: John Voltz <john.voltz@gmail.com>
Date: Mon, 4 Aug 2008 08:41:24 -0400
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <223E6519BDCAC74695BEE9D163F8E6592306E3@oakleaf10.oakleafconsultancy.com>
References: <223E6519BDCAC74695BEE9D163F8E6592306E3@oakleaf10.oakleafconsultancy.com>
Message-ID: <46a136670808040541i6fbfa201o10da56b19fd3a053@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do you get any warnings when compiling your test program? What happens if
you: test = 1.0;

I'm thinking maybe it's a casting problem.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080804/014d0417/attachment.htm 
