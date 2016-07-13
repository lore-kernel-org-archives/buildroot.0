From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 13 Jul 2016 15:26:45 +0200
Subject: [Buildroot] servers unavailable
In-Reply-To: <87mvll6825.fsf@dell.be.48ers.dk>
References: <1468408735.29064.17.camel@synopsys.com>
 <87mvll6825.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VkBy3_krEK-buHDxhMq_ooYLA=HODWovLjeFvpZ6M=zEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

2016-07-13 14:23 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:
>
>  > Hi Peter and Thomas,
>  > Today (June 13, 2016) many buildroot resources became
>  > unavailable. E.g. me and Alexey Brodkin are not able to get response
>  > from:
>  >      - https://git.buildroot.net/
>  >      - https://buildroot.org/
>
>  > So inter alia we can't access your git repo to download upstream changes.
>  > Are you working now on this problem?
>  > Could we hope the issue would be solved in near future?
>
> Yes, the server is unfortunately under a DDoS attack. For git, you can
> temporarily use the github mirror:
>
> https://github.com/buildroot/buildroot

Since buildroot has a github account, why keep the website outside?!
Github offers github pages with custom domain and protected against
ddos attacks (and many more attack vectors).
And why use a custom git server? We can always switch off pull
requests and issues and keep the patch flow going as it goes now if we
switch to github.

Sincerely, Angelo


>
> --
> Venlig hilsen,
> Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
