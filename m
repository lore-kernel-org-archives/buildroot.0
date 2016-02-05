From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Feb 2016 16:06:44 +0000
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link reference
 in buildroot image
In-Reply-To: <bug-8651-163@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
Message-ID: <bug-8651-163-IJZ2QuHAKx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

--- Comment #4 from Markus Egle <Markus.Egle@Qiagen.com> ---
The config file on the target shows this wrong path to the lib. 

grep home /etc/mono/config
        <dllmap dll="MonoPosixHelper"
target="/home/userX/buildroot/output/host/usr/lib/libMonoPosixHelper.so"
os="!windows" />

-- 
You are receiving this mail because:
You are on the CC list for the bug.
