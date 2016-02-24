From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 24 Feb 2016 16:35:19 -0500
Subject: [Buildroot] Why not perform a shallow clone?
In-Reply-To: <56CE1FC5.8090408@mind.be>
References: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
 <CAHXCMMKHZ0usTWkgfJUbM6P4zLV2ZkAxQB9H9KrTVPar=fMEuA@mail.gmail.com>
 <CAF_dkJCZ3SzR3u7RASj-9ABxd8D70p6V1BGdVKZNnPKtFay0Gg@mail.gmail.com>
 <CAF_dkJCgzJQE4i1DbDF_=eVgfEDJHDiwD-qRAjQe72ar+_=YBg@mail.gmail.com>
 <56CE1FC5.8090408@mind.be>
Message-ID: <CAF_dkJDc5VT1VkmNBi3CRuLWaeoAbpmmkMdCXMwGWgO27eX23g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 24, 2016 at 4:25 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/24/16 21:18, Patrick Doyle wrote:
>> On Wed, Feb 24, 2016 at 2:50 PM, Patrick Doyle <wpdster@gmail.com> wrote:
>> No, that doesn't seem to work either.  linux.mk doesn't use $(call
>> github).  Oh well.
>
>  $(call github) is not really needed, you can just use the actual URL in your
> config: https://github.com/<project>/<repo>/archive/<version>/<version>.tar.gz
>
Oh, that's clever!  Thank you very much!

--wpd
