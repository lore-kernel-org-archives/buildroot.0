From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 00:08:15 +0100
Subject: [Buildroot] [PATCH 0/2] Updates to Poppler
In-Reply-To: <1413143813-26783-1-git-send-email-alan@signal11.us>
References: <20140406120221.5a5fd253@skate>
 <1413143813-26783-1-git-send-email-alan@signal11.us>
Message-ID: <20141210000815.7f6b45a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alan Ott,

On Sun, 12 Oct 2014 15:56:51 -0400, Alan Ott wrote:
> These changes were proposed by Jeremie Scheer <jeremie.scheer@armadeus.com>
> earlier this year.
> 
> Alan Ott (2):
>   poppler: Add option for Qt support
>   poppler: Install files into staging
> 
>  package/poppler/Config.in  | 9 +++++++++
>  package/poppler/poppler.mk | 8 ++++++++
>  2 files changed, 17 insertions(+)

Thanks, both patches committed. I've done some minor changes on the
first patch in the Config.in file, see:

  http://git.buildroot.net/buildroot/commit/?id=fb79843453704ae68cf8d91e2a9cd5359d0b1027
  http://git.buildroot.net/buildroot/commit/?id=ed592d6e02275c4402f477693195d941a481e67d

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
