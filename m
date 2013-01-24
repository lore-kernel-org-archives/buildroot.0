From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2013 13:44:43 +0100
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <5100D7E5.1060707@mind.be> (Arnout Vandecappelle's message of
 "Thu, 24 Jan 2013 07:42:45 +0100")
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
 <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
 <20130121181139.09c586ce@skate>
 <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
 <20130121185143.7b62db61@skate> <5100D7E5.1060707@mind.be>
Message-ID: <87txq621j8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Would it be possible to add legacy config or .mk options that
 Arnout> solve the migrated devtables and skeleton issue? Because this
 Arnout> problem will not have gone away with the 2013.02 release,
 Arnout> people will still be upgrading from 2012.08 or earlier.

I don't think it can be solved nicely in kconfig, but we could fix it up
automatically with sed on the .config.

-- 
Bye, Peter Korsgaard
