From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 09:19:50 +0100
Subject: [Buildroot] luaposix not working with luajit/lua5.1
In-Reply-To: <68b6cf23-7e53-265e-95c1-708f7454c69e@mind.be> (Arnout
 Vandecappelle's message of "Tue, 21 Feb 2017 09:07:47 +0100")
References: <257db515-cfda-4122-55e9-b7783b28dfcf@mind.be>
 <CAB0FRsvL0pR974ur0v9b5R=wphQSJStxfJ6YkiECVX4DLoAkdg@mail.gmail.com>
 <270d2a5f-178d-9937-988c-01791cb15dba@mind.be>
 <CAB0FRsvqj=1EQrHKH2Zzn8DLtCbF3q+8_WvcUJxrwLuN-QBE1w@mail.gmail.com>
 <97696395-f4b0-a39a-7b6d-ba5aa68105c2@mind.be>
 <87r32spq2b.fsf@dell.be.48ers.dk>
 <68b6cf23-7e53-265e-95c1-708f7454c69e@mind.be>
Message-ID: <87shn8neft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> It would be nice from a consistency POV, but as Fran?ois says, renaming
 >> stuff is a bit painful for existing users. Perhaps we can just make sure
 >> new lua packages are prefixed with lua-?

 >  I wasn't actually considering renaming all those packages :-)

Ahh, ok - good.

 >  How about adding a comment in package/Config.in that explains that
 > all new packages should start with lua- ? I'll do that as part of
 > submitting lua-bit32.

Yes, sounds good - Thanks!

-- 
Bye, Peter Korsgaard
