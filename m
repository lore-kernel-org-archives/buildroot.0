From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 22:02:01 +0200
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.4.4
In-Reply-To: <20180817154418.19080-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 17 Aug 2018 17:44:18 +0200")
References: <20180817154418.19080-1-peter@korsgaard.com>
Message-ID: <87a7pkoj7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-17405: Command injection vulnerability in Net::FTP (2.4.3):
 > https://www.ruby-lang.org/en/news/2017/12/14/net-ftp-command-injection-cve-2017-17405/

 > CVE-2017-17742: HTTP response splitting in WEBrick (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/

 > CVE-2018-6914: Unintentional file and directory creation with directory
 > traversal in tempfile and tmpdir (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/

 > CVE-2018-8777: DoS by large request in WEBrick (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/

 > CVE-2018-8778: Buffer under-read in String#unpack (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/

 > CVE-2018-8779: Unintentional socket creation by poisoned NUL byte in
 > UNIXServer and UNIXSocket (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/

 > CVE-2018-8780: Unintentional directory traversal by poisoned NUL byte in Dir
 > (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/

 > Multiple vulnerabilities in RubyGems (2.4.4):
 > https://www.ruby-lang.org/en/news/2018/02/17/multiple-vulnerabilities-in-rubygems/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
