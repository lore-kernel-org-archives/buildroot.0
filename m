From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Feb 2019 21:03:24 +0100
Subject: [Buildroot] [PATCH] package/pugixml: force-enable 'long long'
 support to support gcc<4.8
In-Reply-To: <87sgx2j9h7.fsf@dell.be.48ers.dk>
References: <20190205142826.18285-1-patrickdepinguin@gmail.com>
 <87sgx2j9h7.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUCBNapYcA0cYixRB5uLeZwjURmvPGzksGNcnXq51yEVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 5 feb. 2019 a las 20:55, Peter Korsgaard
(<peter@korsgaard.com>) escribi?:
>
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > Although pugixml will enable 'long long' support automatically if it detects
>  > C++11 (gcc 4.8+), we would like to support older gcc compilers too.
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> 4.8 is really old, but OK.

Yes. The Marvell Octeon toolchain still has 4.7.0...

Thanks for applying...

/Thomas
