From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Nov 2015 21:34:20 +0100
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
 <20151108164905.27d41c84@free-electrons.com>
 <CAKbGBLj5_4nQw+j=AAXWLNx8+OGYGUCrZuhpV3EFTCqYxSZe3g@mail.gmail.com>
 <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
Message-ID: <20151109213420.616308f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Nov 2015 08:59:07 -0800, Steven Noonan wrote:

> It looks like it's probably as simple as:
> 
> diff --git a/python/setup.py b/python/setup.py
> index 2450a77..6f6bffb 100755
> --- a/python/setup.py
> +++ b/python/setup.py
> @@ -189,7 +189,6 @@ if __name__ == '__main__':
>            'google.protobuf.text_format'],
>          cmdclass = { 'clean': clean, 'build_py': build_py },
>          install_requires = ['setuptools'],
> -        setup_requires = ['google-apputils'],
>          ext_modules = ext_module_list,
>          url = 'https://developers.google.com/protocol-buffers/',
>          maintainer = maintainer_email,

Can you submit this as a proper patch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
