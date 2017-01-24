From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 17:31:02 +0100
Subject: [Buildroot] [PATCH 2/3] micropython-lib: depend on pcre
In-Reply-To: <20170124101423.11479-2-judge.packham@gmail.com> (Chris Packham's
 message of "Tue, 24 Jan 2017 23:14:22 +1300")
References: <20170124101423.11479-1-judge.packham@gmail.com>
 <20170124101423.11479-2-judge.packham@gmail.com>
Message-ID: <87y3y0h12x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > The micropython libs load libpcre dynamically using the foreign function
 > interface (libffi). Without pcre the build will succeed but at run time
 > anything that uses the 're' module will have issues.

Using 'depend on' in the subject is imho a bit confusing, as you are
selecting it, so I reworded it a bit and committed, thanks.

-- 
Bye, Peter Korsgaard
