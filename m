From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 19:58:07 -0300
Subject: [Buildroot] [git commit] pulseview: needs boost
 atomic/date_time as well
In-Reply-To: <d6sgscxrmh.ln2@ID-313208.user.individual.net>
References: <20160325215140.07917800F2@busybox.osuosl.org>
 <d6sgscxrmh.ln2@ID-313208.user.individual.net>
Message-ID: <56F5C27F.4020100@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/16 19:54, Bernd Kuhls wrote:

> Hi Peter,
>
> building pulseview with this patch reverted works after the cmake bump to
> 3.5.1.

Hi Bernd.
cmake 3.5.1 fixed a FindBoost bug on indirect dependencies:

http://public.kitware.com/pipermail/cmake/2016-March/063085.html

Regards.
