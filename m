From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 17:47:44 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/libllcp: drop wrong comment
In-Reply-To: <20201213220329.735998-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Dec 2020 23:03:29 +0100")
References: <20201213220329.735998-1-fontaine.fabrice@gmail.com>
Message-ID: <87turv72kv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dependency on threads comes from libllcp itself not from libusb (which
 > is not even selected)

 > While at it, also add a comment about this dependency

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add a comment

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
