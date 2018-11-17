From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Nov 2018 22:05:29 +0100
Subject: [Buildroot] [PATCH 1/1] easydbus: fix build without C++
In-Reply-To: <20181117130054.21752-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Nov 2018 14:00:54 +0100")
References: <20181117130054.21752-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0r3pg86.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Specify that easydbus is a C project file otherwise build will fail if
 > no C++ compiler is found by cmake

 > Fixes:
 >  - http://autobuild.buildroot.org/results/486c3cd98124e7415dee2fd1463bd5e0fcc9ba91

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
