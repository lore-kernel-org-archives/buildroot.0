From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 16 Jan 2018 23:52:22 +0200
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
In-Reply-To: <8i82jex0fn.ln2@ID-313208.user.individual.net>
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
 <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
 <jtksiex3i1.ln2@ID-313208.user.individual.net>
 <1a1a4349-bb17-6657-1d60-2e8c7891b0e9@petroprogram.com>
 <8i82jex0fn.ln2@ID-313208.user.individual.net>
Message-ID: <2cacb101-8c6b-7eab-8c5f-0f67e32bf183@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd


Bernd Kuhls kirjoitti 16.01.2018 klo 23:48:
> Am Tue, 16 Jan 2018 23:28:58 +0200 schrieb Stefan Fr?berg:
>
>> Hello Bernd
>>
>> I have a little problem. I have ran all the tests now but my
>> $HOME/tests-unbound is totally empty.
>> What I am doing wrong?
> Hi Stefan,
>
> I wrote
>
> $ utils/test-pkg -c test-unbound $HOME/test-unbound
>
> and forgot to add "-d" before $HOME/test-unbound, sorry.
>
No problem at all :-)

> The correct syntax would have been
>
> $ utils/test-pkg -c test-unbound -d $HOME/test-unbound
>
> Therefore $HOME/test-unbound was not used but you should find the builds 
> in $HOME/br-test-pkg/ instead, this is the default value.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

You are right. Thank god and Thank You!

Best Regards
Stefan
