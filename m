From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 14 Jul 2015 12:58:32 -0300
Subject: [Buildroot] [PATCH v4 3/3] toolchain: disable internal for
 blackfin
In-Reply-To: <20150714154326.GD2332@tarshish>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-4-git-send-email-guido@vanguardiasur.com.ar>
 <20150714154326.GD2332@tarshish>
Message-ID: <20150714155832.GB8327@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 14, 2015 at 06:43:26PM +0300, Baruch Siach wrote:
> Hi Guido,
> 
> On Tue, Jul 14, 2015 at 12:11:04PM -0300, Guido Mart?nez wrote:
> > The internal toolchain won't work with Cortex-M3, mostly because of the
> > fact that some packages (notably: uclibc and glibc) fall back to regular
> > ARM instructions in some situations, and Cortex-M3 has no support for
> > those kind of instructions.
> > 
> > So, just disable it for now and rely on the external toolchain.
> 
> Subject line does not match the patch.
Ugh, that's what I get for looking at the log and copying.

Sorry!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
