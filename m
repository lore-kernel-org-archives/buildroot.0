From: =?windows-1252?Q?Peter_K=FCmmel?= <syntheticpp@gmx.net>
Date: Fri, 12 Dec 2014 10:15:12 +0100
Subject: [Buildroot] B2_EXTERNAL and patches
In-Reply-To: <20141212100653.54e396c9@free-electrons.com>
References: <trinity-73676462-8b93-436d-9361-468b01882a1f-1418374738886@3capp-gmx-bs63>
 <20141212100653.54e396c9@free-electrons.com>
Message-ID: <548AB220.501@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 12.12.2014 um 10:06 schrieb Thomas Petazzoni:
> Dear Peter Kuemmel,
>
> On Fri, 12 Dec 2014 09:58:58 +0100, Peter Kuemmel wrote:
>
>> I would like use one minimal patched Builroot release in one branch for multiple projects,
>> so is it also possible to maintain different patches for a packages in different external folders?
>> Or could the selecition of patches be controlled by a configuration file?
>> (the different pachtes are necessary because of differenr kernel versions)
>
> You want to have a look at BR2_GLOBAL_PATCH_DIR.
>
> Best regards,
>
> Thomas
>

Thanks, that's what I'm looking for!

Peter
