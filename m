From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 09:58:09 +0200
Subject: [Buildroot] [PATCH v2] pkg-kernel-module: Die when kernel
 module are disabled
In-Reply-To: <87h9nx887c.fsf@dell.be.48ers.dk>
References: <1439795444-32337-1-git-send-email-nrubinstein@aldebaran.com>
 <20150817163030.15ea69aa@free-electrons.com>
 <87h9nx887c.fsf@dell.be.48ers.dk>
Message-ID: <20150818095809.1384f7da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Aug 2015 07:41:11 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear No? Rubinstein,
>  > On Mon, 17 Aug 2015 09:10:44 +0200, No? Rubinstein wrote:
>  >> Test the config of the kernel to see if loadable module support is
>  >> enabled, and error out otherwise. This makes the build failure less
>  >> confusing.
>  >> 
>  >> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
>  >> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  >> ---
>  >> package/pkg-kernel-module.mk | 4 ++++
>  >> 1 file changed, 4 insertions(+)
> 
>  > Applied after tweaking the commit log, thanks.
> 
> Couldn't we instead just force modules support on in the kernel if the
> pkg-kernel-module infrastructure is used?

That's another option, yes. No??

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
