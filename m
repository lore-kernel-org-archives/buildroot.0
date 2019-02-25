From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 25 Feb 2019 03:10:03 +0200
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20190222212912.727ff0c2@windsurf>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
 <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
 <CAMw6YJL9ciuU=tScsbV3rqH1KFd+OaPn6jN+DrUDqTdLizqQCA@mail.gmail.com>
 <20190222212912.727ff0c2@windsurf>
Message-ID: <20190225011003.g7j35hly5bpf2bys@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Feb 22, 2019 at 09:29:12PM +0100, Thomas Petazzoni wrote:
> Vadim,
> 
> On Fri, 22 Feb 2019 20:07:37 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > I 'd try it too, but the provided URL does not work :-(
> 
> I updated the Wiki page with URLs on Github.com. We just shut down the
> git.bootlin.com service a few days ago, so now my personal Buildroot
> Git repo is at https://github.com/tpetazzoni/buildroot/.
> 
> I'm looking forward to your feedback!
> 

I think that in case of per-packages parallel build the logs became
messy and meaningless so I send a patch which allows to do per-package
logging too:

	https://patchwork.ozlabs.org/patch/1047549/

this is a POC so it just shows the idea.

Regards,
Vadim Kochan
