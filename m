From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 21:48:28 +0100
Subject: [Buildroot] [PATCH 0/1] mariadb and mysql
In-Reply-To: <20181108170950.30189-1-chrismcc@gmail.com>
References: <20181108170950.30189-1-chrismcc@gmail.com>
Message-ID: <d9420d7c-1991-4658-63c2-94f56129312b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/11/2018 18:09, Christopher McCrory wrote:
> I ran into this again when testing perl-termreadkey.  I started with an
> existing config that used perl-dbd-mysql. Thought I would send the
> patch I generated a while ago. As an aside, used mariadb because the
> oracle-mysql 5.1 version was EOL 5 ish years ago.

 Feel free to bump it :-)

 However, note that at the moment, there is a huge size difference between
oracle-mysql and mariadb: oracle-mysql server is just around 10MB, while mariadb
is over 100MB.


 Regards,
 Arnout

> 
> Hopefully my commit messages are getting better :)
> 
> 
> 
> Christopher McCrory (1):
>   mariadb: fix mysql_config when cross compiling
> 
>  package/mariadb/mariadb.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
