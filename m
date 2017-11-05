From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 14:50:28 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <6626fb96-a677-2bbe-d801-7352cc4c6428@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2017 13:46:33 +0100")
References: <1509553376-43168-1-git-send-email-sam.voss@rockwellcollins.com>
 <9271f8cc-651b-e302-f82c-9e44a0af24d4@mind.be>
 <87tvy92lyy.fsf@dell.be.48ers.dk> <20171105081900.GC2996@scaer>
 <87lgjl2el7.fsf@dell.be.48ers.dk>
 <6626fb96-a677-2bbe-d801-7352cc4c6428@mind.be>
Message-ID: <871slc3kd7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Hmm, I could only find Arnouts mail asking to use select, but he didn't
 >> write why. Arnout, why not use depends on here?

 >  I was just applying the default principle that you should use select rather
 > than depends unless there is a good reason to use depends. I hadn't thought of
 > backward compatibility back then, and I didn't think of using depends now.

 >  I've already committed, can you fix it up?

Sure!

-- 
Bye, Peter Korsgaard
