From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Mar 2017 23:08:17 +0100
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <6166a3fa-e697-bae9-2dbf-e1153472a027@mind.be> (Arnout
 Vandecappelle's message of "Fri, 3 Mar 2017 23:04:03 +0100")
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com>
 <877f47hccp.fsf@dell.be.48ers.dk>
 <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
 <20170302214346.1157dda6@free-electrons.com>
 <87innqf5kd.fsf@dell.be.48ers.dk>
 <6166a3fa-e697-bae9-2dbf-e1153472a027@mind.be>
Message-ID: <87bmtif1ym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03-03-17 21:50, Peter Korsgaard wrote:
 >>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 >> 
 >> Hi,
 >> 
 >> > I'm not sure what to do in this case? Blindly take the new upstream
 >> > version? Complain to upstream?
 >> 
 >> We should probably update. I have mailed support at ncftp.com asking them
 >> what happened.
 >> 
 >> I will let you know when/if I hear back from them.

 >  This is terribly annoying, however, since we just released 2017.02 with the
 > 7abd3e8f hash. So now people are downloading it from sources.buildroot.net. But
 > if we apply the new hash and update sources.buildroot.net, people using the
 > 2017.02 release have no way to download ncftp anymore...

Indeed :/ We can naturally fix it in 2017.02.1, but still. Lets see what
the ncftp guys say.

-- 
Bye, Peter Korsgaard
