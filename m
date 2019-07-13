From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2019 22:05:02 +0200
Subject: [Buildroot] Qt5 LTS handling [was: package/qt5: bump latest
 version to 5.12.4]
In-Reply-To: <87k1cm9smt.fsf@dell.be.48ers.dk>
References: <20190710173645.15459-1-ps.report@gmx.net>
 <20190710173645.15459-2-ps.report@gmx.net>
 <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
 <20190711210233.0b7eb0aa@gmx.net>
 <93af8798-0395-2c9f-dd0f-aad677dc0909@mind.be>
 <20190712211529.00fbf6e0@gmx.net>
 <8f646260-7e2b-8d47-82c0-2624e86cfb56@mind.be>
 <87k1cm9smt.fsf@dell.be.48ers.dk>
Message-ID: <51e24fc6-c609-b1b9-b2f3-5bf213b71436@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/07/2019 11:43, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >>> So actually, my proposal would be to forego the LTS entirely and just go for
>  >>> latest. That does mean that we end up with an unmaintained qt5 in our own LTS
>  >>> branch. For example, Qt 5.14 will probably get its last update around June 2020.
>  >>> Note that the current situation (LTS vs. Latest choice) would not be a solution
>  >>> for that - the Latest would still be in the unmaintained situation, so it would
>  >>> in practice not be useable.
> 
>  >  Addendum to my earlier statement: in my (admittedly limited) experience, there
>  > isn't really much reason to stick to LTS releases. Backward compatibility is
>  > generally OK, and regressions can be fixed.
> 
> I also don't use Qt, so I know next to nothing about it. With Qt5.6 EOL
> (so the GPL2/3 issue no longer applicable) then I'm fine with a single
> Qt5 version if that is the general agreement among users.

 Just as a reminder: if we just have latest, we would end up with Qt 5.14 in
2020.02, but that will stop receiving updates in June or so. So we will have
half a year without (security) updates to Qt.

 IMO, LTS is best effort so this is acceptable.

 Regards,
 Arnout
