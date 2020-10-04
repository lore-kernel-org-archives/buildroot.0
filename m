From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 20:43:28 +0200
Subject: [Buildroot] [PATCH 2020.02.x,
 1/1] package/memcached: security bump to version 1.5.22
In-Reply-To: <20201004105038.407926-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Oct 2020 12:50:38 +0200")
References: <20201004105038.407926-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo05rfvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix a security issue: When enabling SASL authentication for binary
 >   protocol, enabling UDP mode would allow bypassing SASL. Now refuses
 >   to start with both UDP and SASL enabled. Text mode authentication was
 >   not vulnerable.
 > - Drop patches (already in version) and so autoreconf
 > - Update indentation in hash file (two spaces)

 > https://github.com/memcached/memcached/wiki/ReleaseNotes1522

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
