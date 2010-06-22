From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jun 2010 22:33:48 +0200
Subject: [Buildroot] [PATCH] rsync build fix
In-Reply-To: <AANLkTinKoHuTnyYD9RfzItMxhQsAouMfIRbyGZ7v-Hzu@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue, 22 Jun 2010
	14:01:30 -0300")
References: <4C1BB673.7080202@zacarias.com.ar>
	<AANLkTinKoHuTnyYD9RfzItMxhQsAouMfIRbyGZ7v-Hzu@mail.gmail.com>
Message-ID: <878w667qoj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> Rsync fails to build with a central config cache enabled since
 >> ac_cv_type_struct_sockaddr_storage is wrong thus redefining the
 >> sockaddr_storage struct.
 >> Please test and commit.
 >> 

 Thiago> Tested here, and worked great.

 Thiago> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>

 Thiago> PS: Forgot to include the list address, sorry for the duplicate.

Again, I think this fix just pampers over another bug, E.G. some other
package that puts the wrong value into the config.cache.

I haven't been able to reproduce it here, care to send your .config?

-- 
Bye, Peter Korsgaard
