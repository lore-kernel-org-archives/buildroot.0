From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 10:56:12 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
In-Reply-To: <d6cda7730806180648u5bf7bd6esd4c882c3de6a118b@mail.gmail.com>
References: <20080618084529.3973AF8007@busybox.net>
	<20080618092206.GE32192@mx.loc> <87r6av59np.fsf@macbook.be.48ers.dk>
	<d6cda7730806180648u5bf7bd6esd4c882c3de6a118b@mail.gmail.com>
Message-ID: <d6cda7730806180656p13917415j6ec9ea1b7307afb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 10:48 AM, Thiago A. Corr?a
<thiago.correa@gmail.com> wrote:
> On Wed, Jun 18, 2008 at 7:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>>
>> Hi,
>>
>>  Bernhard> this sounds like it should work without patching by just
>>  Bernhard> configuring properly. Also these patches are usually named
>>  Bernhard> "susv3.*legacy" for consistency.
>>
>> Could be - Ulf?
>
> I think it works without that patch even, as I didn't rename it on my
> local copy. Will remove it and try to build again just to make sure.

It built without that patch at all using atngw100_defconfig, which
doesn't enable Sus legacy options, so I think it's safe to remove that
patch.
