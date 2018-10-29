From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 29 Oct 2018 10:16:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-10-28
In-Reply-To: <20181029070026.9C8E12099B@mail.bootlin.com>
References: <20181029070026.9C8E12099B@mail.bootlin.com>
Message-ID: <8c72bbcb-d38f-d5b5-d5a6-cc59e3173aad@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 10/29/2018 08:00 AM, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-10-28, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your packages:
> 
>      aarch64 | mmc-utils-37c86e60c0442fef5... | http://autobuild.buildroot.net/results/233ef5c00951b5be10a59408f4a8781ecc658d74
>      aarch64 | mmc-utils-37c86e60c0442fef5... | http://autobuild.buildroot.net/results/eba3cf4ac21095bca5af2d5d1d69aca0c9098f9b
> 

A patch has been proposed to fix this:

https://patchwork.kernel.org/patch/10654531/

Should we copy it in BR or wait for it to be accepted by upstream?

Regards,

-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
