/* Co-dfns Foreign Structures and Helper Functions */

#include <inttypes.h>

/* Core Co-dfns array structure */

struct codfns_array {
	uint16_t  rank;
	uint64_t  size;
	uint8_t   type;
	uint32_t *shape;
	int64_t  *elements;
};

/* Helper functions upon which the compiler relies */

uint64_t
ffi_get_size(struct codfns_array *);

uint16_t
ffi_get_rank(struct codfns_array *);

void
ffi_get_data_int(int64_t *, struct codfns_array *);

void
ffi_get_shape(uint32_t *, struct codfns_array *);

/* Helper functions for in and outside the compiler */

int
ffi_make_array(struct codfns_array **res,
    uint16_t rnk, uint64_t sz, uint32_t *shp, int64_t *dat);

void
array_free(struct codfns_array *arr);

int
array_cp(struct codfns_array *tgt, struct codfns_array *src);

/* Runtime functions */

int
codfns_add(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_subtract(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_multiply(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_divide(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_magnitude(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_power(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_log(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_max(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_min(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_less(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_less_or_equal(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_equal(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_not_equal(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_greater_or_equal(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_greater(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

int
codfns_not(struct codfns_array *,
    struct codfns_array *, struct codfns_array *);

