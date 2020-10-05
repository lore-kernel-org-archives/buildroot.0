From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Oct 2020 08:11:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version
 7.4.11
In-Reply-To: <20201003202131.288348-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Oct 2020 22:21:31 +0200")
References: <20201003202131.288348-1-fontaine.fabrice@gmail.com>
Message-ID: <87d01xp5hi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-7069: In PHP versions 7.2.x below 7.2.34, 7.3.x below
 >   7.3.23 and 7.4.x below 7.4.11, when AES-CCM mode is used with
 >   openssl_encrypt() function with 12 bytes IV, only first 7 bytes of the
 >   IV is actually used. This can lead to both decreased security and
 >   incorrect encryption data.
 > - Fix CVE-2020-7070: In PHP versions 7.2.x below 7.2.34, 7.3.x below
 >   7.3.23 and 7.4.x below 7.4.11, when PHP is processing incoming HTTP
 >   cookie values, the cookie names are url-decoded. This may lead to
 >   cookies with prefixes like __Host confused with cookies that decode to
 >   such prefix, thus leading to an attacker being able to forge cookie
 >   which is supposed to be secure. See also CVE-2020-8184 for more
 >   information.

 > https://www.php.net/ChangeLog-7.php#7.4.11

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
