From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 10 Feb 2020 19:47:33 +0100
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.4.3
In-Reply-To: <20200210183213.GA22114@dell5510>
References: <20200210120353.49600-1-giulio.benetti@benettiengineering.com>
 <20200210183213.GA22114@dell5510>
Message-ID: <275ee76b-cd07-26fe-c0d7-2bf7cd831815@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On 2/10/20 7:32 PM, Petr Vorel wrote:
> Hi Giulio,
> 
>> Bump to version 2.4.3 of nfs-utils. All patches have been upstreamed, so
>> drop them all. It must be used rpcgen build by host-nfs-utils, to do
>> this let's pass its path to --with-rpcgen= instead of 'internal'.
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for reviewing.

> Thanks for updating it.
> I've tested it some time ago, but there are a few more upstream changes so going
> to test it again.

Ok thank you, I've tested with test-pkg -a, better double check since 
it's a big version jump ;-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Kind regards,
> Petr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
