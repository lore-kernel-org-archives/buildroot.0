From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jul 2019 11:11:22 +0000
Subject: [Buildroot] [Bug 12011] cronstamps directory is not created by
 dcron package
In-Reply-To: <bug-12011-163@https.bugs.busybox.net/>
References: <bug-12011-163@https.bugs.busybox.net/>
Message-ID: <bug-12011-163-NK0DntqNQm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12011

--- Comment #7 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Dominique Tronche from comment #6)

As Yann clarified in his review of my patch,

"Getting a presistent storage, and customisations of the directory layout
to use those persistent locations, can not be done in a generic way. It
can only be handled locally, as each one will need to adapt to their own
constraints."

So I submitted a second patch with a better solution:

    https://patchwork.ozlabs.org/patch/1134631/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
