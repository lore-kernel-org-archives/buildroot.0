From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2019 22:31:41 +0200
Subject: [Buildroot] [PATCH 02/19] autobuild-run: move instance variable
 from kwargs to Builder class
In-Reply-To: <20190621084730.16411-2-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-2-itsatharva@gmail.com>
Message-ID: <ac88b445-dfe1-9a12-76d6-3aa97687583a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> As discussed in the previous patch, these common variables are needed
> in many functions, and it'll be better to have them as part of the class.
> This will make the code cleaner and make it easier to introduce variability
> for reproducibility testing. Succeeding patches will move all variables from
> kwargs to the Builder constructor.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout
