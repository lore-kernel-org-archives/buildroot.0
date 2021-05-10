From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 09:17:42 +0200
Subject: [Buildroot] [PATCH v2 1/3] ARC: config: explicit'ify -mcpu for
 cpu selection
In-Reply-To: <20210507004344.3166099-2-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Thu, 6 May 2021 17:43:42 -0700")
References: <20210507004344.3166099-1-vgupta@synopsys.com>
 <20210507004344.3166099-2-vgupta@synopsys.com>
Message-ID: <87im3rt5ux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
 > ---
 >  arch/Config.in.arc | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
 > index f7a6d920b50d..f84dfab38ae9 100644
 > --- a/arch/Config.in.arc
 > +++ b/arch/Config.in.arc
 > @@ -12,14 +12,14 @@ config BR2_arc770d
 >  	bool "ARC 770D"
 
 >  config BR2_archs38
 > -	bool "ARC HS38"
 > +	bool "ARC HS38 (-mcpu=archs)"

I guess this could be handy for some users, but why are you not doing it
for all variants?

-- 
Bye, Peter Korsgaard
