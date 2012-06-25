From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jun 2012 09:34:15 +0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.3.0
In-Reply-To: <87obo79a8r.fsf@macbook.be.48ers.dk>
References: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
 <87obo79a8r.fsf@macbook.be.48ers.dk>
Message-ID: <20120625063415.GA22395@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jun 25, 2012 at 08:27:48AM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  Baruch> ---
>  Baruch>  package/libpcap/libpcap.mk |    2 +-
>  Baruch>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks, but:
> 
> Applying libpcap-dont-fail-on-missing-netfilter.patch using patch: 
> patching file pcap-netfilter-linux.c
> Reversed (or previously applied) patch detected!  Assume -R? [n] 
> 
> Have you tested this against git head?

No, I've tested against 12.05. Sorry. I'll test against HEAD now.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
