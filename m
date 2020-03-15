From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:10:03 +0100
Subject: [Buildroot] [PATCH 2/2] package/libvncserver: fix CVE-2019-15681
In-Reply-To: <20200303190232.226493-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 20:02:32 +0100")
References: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
 <20200303190232.226493-2-fontaine.fabrice@gmail.com>
Message-ID: <87v9n6nd38.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > LibVNC commit before d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a contains a
 > memory leak (CWE-655) in VNC server code, which allow an attacker to
 > read stack memory and can be abused for information disclosure. Combined
 > with another vulnerability, it can be used to leak stack memory and
 > bypass ASLR. This attack appear to be exploitable via network
 > connectivity. These vulnerabilities have been fixed in commit
 > d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
