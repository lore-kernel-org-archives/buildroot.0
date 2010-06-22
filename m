From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 22 Jun 2010 14:01:30 -0300
Subject: [Buildroot] [PATCH] rsync build fix
In-Reply-To: <4C1BB673.7080202@zacarias.com.ar>
References: <4C1BB673.7080202@zacarias.com.ar>
Message-ID: <AANLkTinKoHuTnyYD9RfzItMxhQsAouMfIRbyGZ7v-Hzu@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Jun 18, 2010 at 3:09 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
>
> Rsync fails to build with a central config cache enabled since
> ac_cv_type_struct_sockaddr_storage is wrong thus redefining the
> sockaddr_storage struct.
> Please test and commit.
>

Tested here, and worked great.

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>

PS: Forgot to include the list address, sorry for the duplicate.

Kind Regards,
   Thiago A. Correa
