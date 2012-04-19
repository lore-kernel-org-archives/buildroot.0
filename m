From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Apr 2012 16:09:48 +0200
Subject: [Buildroot] [PATCH 09/22] Remove unused .fakeroot.* mechanism
In-Reply-To: <a5d1f43e9d123e5e8a7b6c44240b5d8928ea161d.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:21 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <a5d1f43e9d123e5e8a7b6c44240b5d8928ea161d.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87obqnlsnn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> There used to be a mechanism using which packages could leave a
 Thomas> .fakeroot.<something> file which could contain commands to be executed
 Thomas> within the fakeroot environment. Since this mechanism is no longer
 Thomas> used by any package, remove it from the common infrastructure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
