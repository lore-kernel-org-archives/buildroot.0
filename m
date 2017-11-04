From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Nov 2017 23:36:19 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171104232055.2e196d56@windsurf> (Thomas Petazzoni's message of
 "Sat, 4 Nov 2017 23:20:55 +0100")
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
 <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
 <20171104232055.2e196d56@windsurf>
Message-ID: <877ev54qos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 4 Nov 2017 23:18:52 +0100, Arnout Vandecappelle wrote:

 >> >> Static linking issue. Who volunteers to have a look? We don't even have
 >> >> a person listed in the DEVELOPERS file for gstreamer.  
 >> > Still unfixed. Anyone?  
 >> 
 >> I don't think anybody is motivated to maintain the now severely deprecated
 >> gstreamer0.10. maybe it's time to remove it? Or at
 >> least, we could remove it from static.

 > I wouldn't mind removing it.

 > Peter? Your call?

If the only thing broken about it is static linking then I think I would
prefer to just mark it as !static for now.

-- 
Bye, Peter Korsgaard
