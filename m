From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 18:33:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to
 version 2.7.2
In-Reply-To: <20210405144708.4151427-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Apr 2021 16:47:08 +0200")
References: <20210405144708.4151427-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0pgr8r2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update indentation in hash file (two spaces)
 > https://github.com/paramiko/paramiko/blob/2.7.2/sites/www/changelog.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/python-paramiko/python-paramiko.hash | 6 +++---
 >  package/python-paramiko/python-paramiko.mk   | 4 ++--
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
 > index 6054e8d492..cd26774cce 100644
 > --- a/package/python-paramiko/python-paramiko.hash
 > +++ b/package/python-paramiko/python-paramiko.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/paramiko/json
 > -md5	bf8239dc820ca86dd3c3226f4281c35f  paramiko-2.7.1.tar.gz
 > -sha256	920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f  paramiko-2.7.1.tar.gz
 > +md5  44136d79da4cd7619e368018ad022619  paramiko-2.7.2.tar.gz
 > +sha256  7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035  paramiko-2.7.2.tar.gz
 >  # Locally computed sha256 checksums
 > -sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
 > +sha256  fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE

Sorry, too fast. Committed after fixing the LICENSE hash as
check-package nicely warned about:

Applying: package/python-paramiko: bump to version 2.7.2
package/python-paramiko/python-paramiko.hash:5: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)

-- 
Bye, Peter Korsgaard
