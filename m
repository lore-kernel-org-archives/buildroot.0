From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 10 Aug 2018 16:56:29 -0400
Subject: [Buildroot] buildroot, python{,3}, and pip
In-Reply-To: <20180810215321.3b1d840d@windsurf>
References: <CAF_dkJCw8P3YcUOgsODcrX_YrdYaYfcxriBFs+dxRSRjUrXf+w@mail.gmail.com>
 <20180810215321.3b1d840d@windsurf>
Message-ID: <CAF_dkJAsx6DDBawp73RAZhXsVpbk7SRGjFdAJjE_oGH55rf2Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 10, 2018 at 3:53 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Patrick,

> The bigger question is why do you need python-pip in the first place ?
> It goes against the Buildroot principle of reproducible builds. Why
> don't you create Buildroot packages for the Python modules that you
> need ? The utils/scanpypi script makes this relatively easy for most
> Python modules.
>
Yeah, yeah, I know... the answer is that we expect our application
code to change much more often than the system code.  And our
application architect would like to distribute the application via
pip.  I'm still not sure we have the memory (RAM) to do this.  Early
experimentation shows that pip requires a _lot_ of RAM.

We'll see where we end up.

Besides, I would rather humor him and stay in my preferred development
environment, than to have to support a Yocto/OE development
environment just so he can use pip :-)

--wpd
