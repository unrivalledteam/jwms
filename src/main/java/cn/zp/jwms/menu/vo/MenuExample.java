package cn.zp.jwms.menu.vo;

import java.util.ArrayList;
import java.util.List;

public class MenuExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public MenuExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andMenuIdIsNull() {
            addCriterion("MENU_ID is null");
            return (Criteria) this;
        }

        public Criteria andMenuIdIsNotNull() {
            addCriterion("MENU_ID is not null");
            return (Criteria) this;
        }

        public Criteria andMenuIdEqualTo(String value) {
            addCriterion("MENU_ID =", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotEqualTo(String value) {
            addCriterion("MENU_ID <>", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdGreaterThan(String value) {
            addCriterion("MENU_ID >", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_ID >=", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLessThan(String value) {
            addCriterion("MENU_ID <", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLessThanOrEqualTo(String value) {
            addCriterion("MENU_ID <=", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdLike(String value) {
            addCriterion("MENU_ID like", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotLike(String value) {
            addCriterion("MENU_ID not like", value, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdIn(List<String> values) {
            addCriterion("MENU_ID in", values, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotIn(List<String> values) {
            addCriterion("MENU_ID not in", values, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdBetween(String value1, String value2) {
            addCriterion("MENU_ID between", value1, value2, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuIdNotBetween(String value1, String value2) {
            addCriterion("MENU_ID not between", value1, value2, "menuId");
            return (Criteria) this;
        }

        public Criteria andMenuNameIsNull() {
            addCriterion("MENU_NAME is null");
            return (Criteria) this;
        }

        public Criteria andMenuNameIsNotNull() {
            addCriterion("MENU_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andMenuNameEqualTo(String value) {
            addCriterion("MENU_NAME =", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotEqualTo(String value) {
            addCriterion("MENU_NAME <>", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameGreaterThan(String value) {
            addCriterion("MENU_NAME >", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameGreaterThanOrEqualTo(String value) {
            addCriterion("MENU_NAME >=", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLessThan(String value) {
            addCriterion("MENU_NAME <", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLessThanOrEqualTo(String value) {
            addCriterion("MENU_NAME <=", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameLike(String value) {
            addCriterion("MENU_NAME like", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotLike(String value) {
            addCriterion("MENU_NAME not like", value, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameIn(List<String> values) {
            addCriterion("MENU_NAME in", values, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotIn(List<String> values) {
            addCriterion("MENU_NAME not in", values, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameBetween(String value1, String value2) {
            addCriterion("MENU_NAME between", value1, value2, "menuName");
            return (Criteria) this;
        }

        public Criteria andMenuNameNotBetween(String value1, String value2) {
            addCriterion("MENU_NAME not between", value1, value2, "menuName");
            return (Criteria) this;
        }

        public Criteria andTargetPageIsNull() {
            addCriterion("TARGET_PAGE is null");
            return (Criteria) this;
        }

        public Criteria andTargetPageIsNotNull() {
            addCriterion("TARGET_PAGE is not null");
            return (Criteria) this;
        }

        public Criteria andTargetPageEqualTo(String value) {
            addCriterion("TARGET_PAGE =", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageNotEqualTo(String value) {
            addCriterion("TARGET_PAGE <>", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageGreaterThan(String value) {
            addCriterion("TARGET_PAGE >", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageGreaterThanOrEqualTo(String value) {
            addCriterion("TARGET_PAGE >=", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageLessThan(String value) {
            addCriterion("TARGET_PAGE <", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageLessThanOrEqualTo(String value) {
            addCriterion("TARGET_PAGE <=", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageLike(String value) {
            addCriterion("TARGET_PAGE like", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageNotLike(String value) {
            addCriterion("TARGET_PAGE not like", value, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageIn(List<String> values) {
            addCriterion("TARGET_PAGE in", values, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageNotIn(List<String> values) {
            addCriterion("TARGET_PAGE not in", values, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageBetween(String value1, String value2) {
            addCriterion("TARGET_PAGE between", value1, value2, "targetPage");
            return (Criteria) this;
        }

        public Criteria andTargetPageNotBetween(String value1, String value2) {
            addCriterion("TARGET_PAGE not between", value1, value2, "targetPage");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdIsNull() {
            addCriterion("BELONG_MENU_ID is null");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdIsNotNull() {
            addCriterion("BELONG_MENU_ID is not null");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdEqualTo(String value) {
            addCriterion("BELONG_MENU_ID =", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdNotEqualTo(String value) {
            addCriterion("BELONG_MENU_ID <>", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdGreaterThan(String value) {
            addCriterion("BELONG_MENU_ID >", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdGreaterThanOrEqualTo(String value) {
            addCriterion("BELONG_MENU_ID >=", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdLessThan(String value) {
            addCriterion("BELONG_MENU_ID <", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdLessThanOrEqualTo(String value) {
            addCriterion("BELONG_MENU_ID <=", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdLike(String value) {
            addCriterion("BELONG_MENU_ID like", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdNotLike(String value) {
            addCriterion("BELONG_MENU_ID not like", value, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdIn(List<String> values) {
            addCriterion("BELONG_MENU_ID in", values, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdNotIn(List<String> values) {
            addCriterion("BELONG_MENU_ID not in", values, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdBetween(String value1, String value2) {
            addCriterion("BELONG_MENU_ID between", value1, value2, "belongMenuId");
            return (Criteria) this;
        }

        public Criteria andBelongMenuIdNotBetween(String value1, String value2) {
            addCriterion("BELONG_MENU_ID not between", value1, value2, "belongMenuId");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}