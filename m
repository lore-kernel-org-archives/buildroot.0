From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Oct 2013 13:01:11 +0200
Subject: [Buildroot] make-4.0
In-Reply-To: <CAB0FRstfgMy3c2t1uUfdkusX8XzwF85CXodwyzVtZ4w6aN-QtQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 10 Oct 2013
 12:11:05 +0200")
References: <CAB0FRstfgMy3c2t1uUfdkusX8XzwF85CXodwyzVtZ4w6aN-QtQ@mail.gmail.com>
Message-ID: <87pprdwft4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 Fran?ois> GNU make 4.0 has been released (see
 Fran?ois> http://savannah.gnu.org/forum/forum.php?forum_id=7749).
 Fran?ois> This version introduces only 1 backward-incompatibility (instead of 7
 Fran?ois> with version 3.82).
 Fran?ois> See below, an extracted part of the file NEWS.

 Fran?ois>   WARNING: Backward-incompatibility!

 Fran?ois>   Variables ending in "!" previously defined as "variable!=
 Fran?ois>   value" will now be interpreted as shell assignment.  Change
 Fran?ois>   your assignment to add whitespace between the "!" and "=":
 Fran?ois>   "variable! = value"

We luckily don't have any of those:

git grep '[^ ]!=' **/*.mk

-- 
Bye, Peter Korsgaard
