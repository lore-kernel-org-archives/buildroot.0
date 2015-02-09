From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 09 Feb 2015 20:37:38 -0300
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <87fvag3tdv.fsf@dell.be.48ers.dk>
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
 <87fvag3tdv.fsf@dell.be.48ers.dk>
Message-ID: <54D944C2.6000902@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/08/2015 07:55 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > - Add version 2.21
>  > - Add a hash value for it
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/glibc/Config.in  |    3 +++
>  >  package/glibc/glibc.hash |    1 +
>  >  2 files changed, 4 insertions(+), 0 deletions(-)
> 
>  > diff --git a/package/glibc/Config.in b/package/glibc/Config.in
>  > index 8c033f2..37e108e 100644
>  > --- a/package/glibc/Config.in
>  > +++ b/package/glibc/Config.in
>  > @@ -38,6 +38,9 @@ config BR2_GLIBC_VERSION_2_19
>  >  config BR2_GLIBC_VERSION_2_20
>  >  	bool "2.20"
>  
>  > +config BR2_GLIBC_VERSION_2_21
>  > +	bool "2.21"
>  > +
> 
> I noticed a few things in the release notes that might be of interest:
> 
> * Port to Altera Nios II has been contributed by Mentor Graphics.
> 
> So we should be able to build an internal glibc toolchain for nios2 now.
> 

Yes, as far as I understand, we should be able to build the toolchain
now. Linux v3.19 has been just released, which includes the nios2 arch port.

So we now have binutils, gcc, glibc and kernel support.

FWIW, the glibc port was tested using Buildroot [1]! :)

[1]
http://sourceware-org.1504.n7.nabble.com/PATCH-0-4-Nios-II-port-submission-td265493.html

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
