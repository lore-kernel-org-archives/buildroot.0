From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 18:30:33 +0100
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <CAHUKsLLd56BrLOeN_7xa1cx3M0M+dbQyX2fxZcc_4nof0k3cFg@mail.gmail.com>
References: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
 <20130308170521.3e8926ff@skate>
 <CAHUKsLLd56BrLOeN_7xa1cx3M0M+dbQyX2fxZcc_4nof0k3cFg@mail.gmail.com>
Message-ID: <20130311183033.51c1ba4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Mon, 11 Mar 2013 11:49:29 -0400, Chris Wilkinson wrote:
> Is this a config error on my part or a BR bug? Stephan suggests it's
> currently a BR limitation that custom tarballs can only be got from an http
> server not a local directory.

Yes, I think Stefan is correct. There is a patch pending to fix this
issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
