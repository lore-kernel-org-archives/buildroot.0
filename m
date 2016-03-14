From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Mar 2016 11:48:58 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-07
In-Reply-To: <87oaao2ma7.fsf@dell.be.48ers.dk>
References: <20160308073022.EFA101019EE@stock.ovh.net>
 <56DF62F1.1020302@lucaceresoli.net> <87oaao2ma7.fsf@dell.be.48ers.dk>
Message-ID: <56E6971A.8080507@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

On 09/03/2016 07:33, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
>  > On 08/03/2016 08:30, Thomas Petazzoni wrote:
>  > [...]
> 
>  >> x86_64 | libpjsip-2.4.5 | NOK |
>  >> http://autobuild.buildroot.net/results/5069fdd4c4a09a6bae2dcbf1f631ece561fe2df0/
> 
>  > Looks like an issue with parallel building. But before forcing MAKE1, I
>  > at least would like to be able to reproduce it... I've tried a few
>  > builds with arbitrary BR2_JLEVEL values but couldn't see it fail here so
>  > far.
> 
> It does look like it indeed. Looking at the other pjsip build errors
> (http://autobuild.buildroot.net/?reason=libpjsip-2.4.5), they seem to be
> about the srtp dependency (which you now fixed). Let's perhaps give it a
> few days and see if it triggers again.

...and it did:

  http://autobuild.buildroot.net/results/173/17357c695d77fe0b010d7c38971489c35c07f5fb/
  http://autobuild.buildroot.net/results/bc6/bc61f48d3675700d306d8419736d04f0c2c05903/

I'll try to reproduce the issue starting from these ones.

-- 
Luca
