From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 16:52:10 +0100
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <CABukmmN-WtUiGpUGTWUhPhkFLOaLAgMNfXujMwMUkNB=P8PHQA@mail.gmail.com>
References: <20171214105706.4577-1-aep@exys.org>
 <20171214105706.4577-2-aep@exys.org>
 <20171214162102.25c6d252@windsurf>
 <CABukmmN-WtUiGpUGTWUhPhkFLOaLAgMNfXujMwMUkNB=P8PHQA@mail.gmail.com>
Message-ID: <20171214165210.40b8f73d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 16:27:36 +0100, Arvid Picciani wrote:

> yes i did see the comment that's why i didnt submit a proper patch but more
> an RFC.
> It builds fine for me. maybe it doesn't try to use the dlopen stuff with
> musl?

I guess musl always has dlopen(), even in a purely statically linked
scenario, while uClibc does not have it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
