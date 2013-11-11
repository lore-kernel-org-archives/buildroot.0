From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 10:06:58 +0000
Subject: [Buildroot] [PATCH] iozone: disable for uClibc 0.9.31
In-Reply-To: <20131111100150.GN4581@tarshish>
References: <1384163348-17932-1-git-send-email-spdawson@gmail.com>
 <87siv36z7u.fsf@dell.be.48ers.dk> <20131111100150.GN4581@tarshish>
Message-ID: <CAHt8ZCNSr1BcofPv6Mpp8DW4s5oYqa_QDGGUMD7SZUXW0xrxaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 11 November 2013 10:01, Baruch Siach <baruch@tkos.co.il> wrote:
> It also depends on BR2_PTHREADS_NATIVE. linuxthreads doesn't have
> pthread_setaffinity_np.

Okay, thanks.

Simon.
