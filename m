From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 20:33:51 +0200
Subject: [Buildroot] [[PATCH v2 07/14] package/mender: select
 BR2_PACKAGE_CA_CERTIFICATES
In-Reply-To: <20180820165427.7f25b056@windsurf>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-8-mirza.krak@northern.tech>
 <20180820165427.7f25b056@windsurf>
Message-ID: <CADHdJwB=UQdmk8vVCPSc-gGBs8RKvAsztKRVYMZbCsSdJqBxRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 4:54 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 20 Aug 2018 15:09:07 +0200, Mirza Krak wrote:
>> Mender uses TLS to community with the management server,
>> and if CA signed certificates are used we must have
>> the ca-certificates package installed to be able to
>> verify these.
>>
>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>
> I am not sure we want to make this a mandatory dependency. If people
> are using a management server that provides a CA signed certificate,
> then they should add the ca-certificates package to their build.
>
> Perhaps this belongs more to a note in the Config.in help text. Or
> maybe even Mender deserves a package/mender/readme.txt, which a bit like
> boot/grub2/readme.txt, would give more details about Mender's
> integration in Buildroot.

Makes sense.

Thanks for the hint on creating a readme.txt. Will make so sure to do that.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
