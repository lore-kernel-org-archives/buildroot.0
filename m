From: John Voltz <john.voltz@gmail.com>
Date: Mon, 23 Jun 2008 19:54:17 -0400
Subject: [Buildroot] Modular X.org
In-Reply-To: <d6cda7730806231513y75b87d5am960d9bbc137a8e5b@mail.gmail.com>
References: <46a136670806231024o11a8f649r583107ac041c23e2@mail.gmail.com>
	<87od5sau6s.fsf@macbook.be.48ers.dk>
	<46a136670806231136r421060aatb105a6bb59ef1f4d@mail.gmail.com>
	<87iqvzalr1.fsf@macbook.be.48ers.dk>
	<d6cda7730806231513y75b87d5am960d9bbc137a8e5b@mail.gmail.com>
Message-ID: <46a136670806231654n755f4358wd0dbdcc66ad8a00e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modular X has been tested with the vesa, mouse, and keyboard drivers on x86
and it works well. One minor caveat, you have to start x with:

startx -- -ignoreABI


or it may complain about ABI mismatch between driver and server. I'm not
sure at the moment how the ABI versions are resolved and how to fix it.

Regards,

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080623/fdbda99f/attachment.htm 
