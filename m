From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Wed, 20 Jun 2007 22:45:18 -0500
Subject: [Buildroot] nios2 and TLS
In-Reply-To: <d1f7544e0706180153v28b69cc6w268bf5ccd3230120@mail.gmail.com>
References: <d1f7544e0706180153v28b69cc6w268bf5ccd3230120@mail.gmail.com>
Message-ID: <4679F44E.9060407@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You need to NOT select NPTL threading.

-Steve
