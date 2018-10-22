From: Patrick Doyle <wpdster@gmail.com>
Date: Sun, 21 Oct 2018 20:56:03 -0400
Subject: [Buildroot] How can I compile a module into the kernel?
In-Reply-To: <87in1v8a5i.fsf@tkos.co.il>
References: <CAF_dkJAn7NgNfn5d0wQDnGF7UoCuFoUZvnpvvYDgWoA7RpV4Ag@mail.gmail.com>
 <20181021095548.41d5f0b9@windsurf.lan>
 <CAF_dkJD1hZ0+8=+j64dMffDULsfG1DufDU8po4zm8VxAfdh0dA@mail.gmail.com>
 <20181021193349.41779f48@windsurf> <87in1v8a5i.fsf@tkos.co.il>
Message-ID: <CAF_dkJBq+Tgxwr371e2hNgza+YvsajEZ3LdQKr_3w6r-DqnDNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 21, 2018 at 1:47 PM Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas, Patrick,
> See the 'modules_disabled' sysctl. It's documented in
> Documentation/sysctl/kernel.txt.
>
> baruch
Excellent!  That's what I needed.  Thanks.

--wpd
