From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 11 Apr 2018 19:15:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-10
In-Reply-To: <20180411060023.A1DEA21984@mail.bootlin.com>
References: <20180411060023.A1DEA21984@mail.bootlin.com>
Message-ID: <d400ac41-7777-5497-14cc-0c5ebb623496@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.04.2018 um 08:00 schrieb Thomas Petazzoni:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-04-10, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
> microblazeel |                   libkrb5-1.16 | http://autobuild.buildroot.net/results/3111ee83b06f4dfb82eea23244dbba5444c13fe7
> 

Hi,

Sadly the configure output here is missing, but as far as I understand it bison/yacc is expected to be installed on the host.
And configure of libkrb5 searches for yacc in this order: "bison -y, byacc, yacc"
So I'm not sure how it comes to "yacc: Command not found"
