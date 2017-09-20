From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Sep 2017 13:03:32 -0500
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <87fubhxnnx.fsf@dell.be.48ers.dk>
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpa9S7chHUTg1GBNz9Qi=r-tMeQnQO2sYpNdZ7oQ+9MP9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Sep 20, 2017 at 12:52 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>
>  > It seems github now sometimes provides slightly changed tarballs which
>  > produce a different sha256 hash than before. Fix the hashes of the
>  > affected packages to avoid downloading from sources.buildroot.net.
>
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> :/
>
> I'm not sure updating the hashes is the correct thing to do. Sources.b.o
> runs 'make source' from the 2017.02.x and master branches to keep it
> uptodate, and E.G. freerdp hasn't been updated since 2017.02, so it will
> break hard for 2017.02.x users if we change it.
>
> Falling back to s.b.o is not such a bad thing, so I think we can wait
> with fixing up the hashes until the packages get bumped.
>
> In the mean time I will try to figure out who to contact at github to
> ask about the change.
>

I'd second it would be better to wait.  The iperf hash issue earlier
this summer created a mess until that was bumped.


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
