From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 14:03:38 +0200
Subject: [Buildroot] BR variable that points the built kernel
In-Reply-To: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
References: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
Message-ID: <20150609140338.49987c19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Pastorelli,

On Tue, 9 Jun 2015 13:41:41 +0200, Marco Pastorelli wrote:

> I'm writing a post build script and I'm looking for a variable that points
> to the directory where the kernel has been built.
> 
> So far I have used ${BUILD_DIR}/linux-custom/ but this is not portable
> since it depends on the kernel version.
> 
> Does anyone know a better way to address my problem?

Use $(LINUX_DIR).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
