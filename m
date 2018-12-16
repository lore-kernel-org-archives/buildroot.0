From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:46:20 +0100
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
 ("Damien =?utf-8?Q?Th=C3=A9bault=22's?= message of "Fri, 7 Dec 2018
 12:41:08 +0000")
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
Message-ID: <875zvt8dbn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Th?bault <damien.thebault@vitec.com> writes:

 > The urlencode parameter is lost in dl-wrapper, because we try to get it
 > from backend instead of backend_urlencode.

 > We must get the urlencode information from backend_urlencode.

 > Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>

Committed to 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
